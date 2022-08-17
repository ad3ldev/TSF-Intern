<script>
	import dbStore from "$lib/stores/db.js";
	import updateStore from "$lib/stores/update.js";
	import validateStore from "$lib/stores/validate";
	import Button from "$lib/components/Button.svelte";
	import Loading from "$lib/components/Loading.svelte";
	import Card from "$lib/components/Card.svelte";
	import { page } from "$app/stores";
	let id = $page.params.id;

	let [data, reading, errorRead, get] = dbStore();
	const [writing, errorWrite, set] = updateStore();
	const [validData, validating, validError, validate] = validateStore();

	let done = false;

	get("customers", "*", "account_num", `${id}`);

	let request = {
		amount: 0,
		date: "",
		time: "",
		from_customer: Number(id),
		to_customer: 0,
	};

	function padTo2Digits(num) {
		return num.toString().padStart(2, "0");
	}

	function formatDate(date) {
		return [
			date.getFullYear(),
			padTo2Digits(date.getMonth() + 1),
			padTo2Digits(date.getDate()),
		].join("-");
	}
	function formatTime(date) {
		return [
			padTo2Digits(date.getHours()),
			padTo2Digits(date.getMinutes()),
			padTo2Digits(date.getSeconds()),
		].join(":");
	}

	function moneny_to_number(string) {
		return Number(string.replace(/[^0-9.-]+/g, ""));
	}
	async function addTransfer() {
		done = false;
		writing.set(true);
		errorWrite.set(false);
		if (request.from_customer != request.to_customer) {
			await validate(
				"customers",
				"account_num,current_balance",
				"account_num",
				request.from_customer,
			);
			let sender = moneny_to_number($validData[0].current_balance);
			if (sender >= request.amount && request.amount > 0) {
				await validate(
					"customers",
					"account_num,current_balance",
					"account_num",
					request.to_customer,
				);
				let receiver = moneny_to_number($validData[0].current_balance);
				sender = sender - request.amount;
				receiver = receiver + request.amount;
				if (!$validError) {
					request.time = formatTime(new Date());
					request.date = formatDate(new Date());
					await set("transfers", request, false);
					let update1 = {
						customer: request.from_customer,
						balance: sender,
					};
					let update2 = {
						customer: request.to_customer,
						balance: receiver,
					};
					await set("customers", update1, true);
					await set("customers", update2, true);
					done = true;
				}
			} else {
				errorWrite.set(true);
			}
		} else {
			errorWrite.set(true);
		}
		get("customers", "*", "account_num", `${id}`);
		writing.set(false);
	}
</script>

<Loading showLoading={$reading || $writing} />
{#if $errorRead}
	<p>errorRead</p>
{:else if !$reading && !$errorRead}
	<a class="back" sveltekit:prefetch href={`../${id}`}>
		<Button>Back</Button>
	</a>
	<Card>
		{#if !$writing}
			<div class="form">
				<div>
					<h1>From Account {id}</h1>
					<h1>{$data[0].current_balance}</h1>
				</div>
				<form
					on:submit|preventDefault={() => {
						addTransfer();
					}}
				>
					<div class="form-field">
						<label for="to-account">To Account</label>
						<input
							type="number"
							id="to-account"
							bind:value={request.to_customer}
						/>
					</div>
					<div class="form-field">
						<label for="amount">Amount</label>
						<input
							type="number"
							step=".01"
							id="amount"
							bind:value={request.amount}
						/>
					</div>
					{#if $validError || $errorWrite}
						<div class="error">Invalid Input</div>
					{/if}
					{#if done}
						<div class="done">Transfer Done</div>
					{/if}
					<Button>Transfer</Button>
				</form>
			</div>
		{/if}
	</Card>
{/if}

<style lang="scss">
	.error {
		color: hsl(0, 100%, 65%);
		font-weight: bold;
		text-align: center;
	}
	.done {
		color: hsl(214, 72%, 58%);
		font-weight: bold;
		text-align: center;
	}
	.back {
		position: fixed;
		margin: 1rem;
	}
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
	input[type="number"] {
		-moz-appearance: textfield;
	}
	.form {
		width: 100%;
		height: 50%;
		display: grid;
		align-items: center;
		justify-items: center;
		grid-template-rows: 1fr 2fr;
		form {
			display: grid;
			width: 60%;
			.form-field {
				display: flex;
				justify-content: space-between;
				align-items: center;
				padding: 2rem;
				input {
					padding: 1rem;
					border: none;
					border-radius: 1rem;
					width: 60%;
					box-shadow: 0 0 1rem 0.1rem
						rgba($color: #000000, $alpha: 0.1);
				}
				label {
					color: hsl(214, 72%, 58%);
				}
			}
		}
	}
</style>

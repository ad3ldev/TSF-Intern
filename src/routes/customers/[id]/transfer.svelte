<script>
	import dbStore from "$lib/stores/db.js";
	import updateStore from "$lib/stores/update.js";
	import validateStore from "$lib/stores/validate";
	import { page } from "$app/stores";
	let id = $page.params.id;

	const [data, reading, errorRead, get] = dbStore();
	const [writing, errorWrite, set] = updateStore();
	const [validData, validating, validError, validate] = validateStore();

	get("customers", "*", "account_num", `${id}`);

	let request = {
		amount: 0.01,
		date: "2069-6-6",
		time: "03:00",
		from_customer: 1,
		to_customer: 7,
	};

	function moneny_to_number(string) {
		return Number(string.replace(/[^0-9.-]+/g, ""));
	}
	async function addTransfer() {
		writing.set(true);
		await validate(
			"customers",
			"account_num,current_balance",
			"account_num",
			request.from_customer,
		);
		let sender = moneny_to_number($validData[0].current_balance);
		if (sender >= request.amount) {
			await validate(
				"customers",
				"account_num,current_balance",
				"account_num",
				request.to_customer,
			);
		}
		let receiver = moneny_to_number($validData[0].current_balance);
		sender = sender - request.amount;
		receiver = receiver + request.amount;
		if (!$validError) {
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
			writing.set(false);
		}
	}
</script>

{#if $reading}
	<p>Loading</p>
{:else if $errorRead}
	<p>error</p>
{:else}
	<button>
		<a href={`../${id}`}>Back</a>
	</button>
	<h1>{$data[0].current_balance}</h1>
	<button
		on:click={() => {
			addTransfer();
		}}>Trial</button
	>
{/if}

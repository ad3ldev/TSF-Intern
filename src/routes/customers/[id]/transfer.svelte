<script>
	import dbStore from "$lib/stores/db.js";
	import updateStore from "$lib/stores/update.js";
	import validateStore from "$lib/stores/validate";
	import { page } from "$app/stores";
	let id = $page.params.id;

	const [data, reading, errorRead, get] = dbStore();
	const [writing, errorWrite, set] = updateStore();
	const [validating, validError, validate] = validateStore();

	get("customers", "*", "account_num", `${id}`);
	async function addTransfer() {
		let request = {
			amount: 500,
			date: "2069-6-6",
			time: "03:00",
			from_customer: 1,
			to_customer: 9,
		};
		await validate("customers", "account_num", "account_num", 1);
		await validate("customers", "account_num", "account_num", 2);
		if (!$validError) {
			console.log("hello");
			set("transfers", request);
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

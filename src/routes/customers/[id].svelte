<script>
	import dbStore from "$lib/stores/db.js";
	import { page } from "$app/stores";
	let id = $page.params.id;
	const [data, reading, writing, error, get, set] = dbStore(
		"customers",
		"*",
		"account_num",
		`${id}`,
	);
	get();
</script>

<div class="customer">
	{#if $reading}
		<p>Loading</p>
	{:else if $error}
		<p>error</p>
	{:else}
		<div class="details">
			<h1>{$data[0].name}</h1>
			<ul>
				<li class="item"
					><strong>Acount Number:</strong> {$data[0].account_num}</li
				>
				<li class="item"
					><strong>Address:</strong> {$data[0].address}</li
				>
				<li class="item"><strong>Phone:</strong> {$data[0].phone}</li>
				<li class="item"><strong>Email:</strong> {$data[0].email}</li>
				<li class="item"
					><strong>Country:</strong> {$data[0].country}</li
				>
				<li class="item"
					><strong>Current Balance:</strong>
					{$data[0].current_balance}</li
				>
			</ul>
		</div>
		<button><a href={`./${id}/transfer`}>Transfer</a></button>
	{/if}
</div>

<style lang="scss">
	.details {
		display: grid;
		justify-items: start;
		padding: 0 10%;
	}
	ul {
		margin: 0;
		padding: 0;
		list-style-type: none;
		.item {
			display: grid;
			padding: 0.5rem;
			grid-template-columns: repeat(2, 1fr);
		}
	}
</style>

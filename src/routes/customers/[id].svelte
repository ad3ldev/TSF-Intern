<script>
	import dbStore from "$lib/stores/db.js";
	import { page } from "$app/stores";
	let id = $page.params.id;
	const [data, loading, error, get] = dbStore(
		"customers",
		"*",
		"account_num",
		`${id}`,
	);
</script>

<div class="customer">
	{#if $loading}
		<p>Loading</p>
	{:else if $error}
		<p>error</p>
	{:else}
		<div class="details">
			<h1>{$data[0].name}</h1>
			<ul>
				<li><strong>Acount Number:</strong> {$data[0].account_num}</li>
				<li><strong>Address:</strong> {$data[0].address}</li>
				<li><strong>Phone:</strong> {$data[0].phone}</li>
				<li><strong>Email:</strong> {$data[0].email}</li>
				<li><strong>Country:</strong> {$data[0].country}</li>
				<li
					><strong>Current Balance:</strong>
					{$data[0].current_balance}</li
				>
			</ul>
		</div>
	{/if}
</div>

<style>
	.details {
		display: grid;
		justify-items: center;
		width: 90%;
	}
</style>

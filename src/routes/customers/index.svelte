<script context="module">
	import CustomersTable from "./CustomersTable.svelte";
	import dbStore from "$lib/stores/db.js";
	const [data, loading, error, get] = dbStore("customers", "*");
</script>

<div>
	<h1>Customers</h1>
	{#if $loading}
		<p>Loading</p>
	{:else if $error}
		<p>error</p>
	{:else}
		<CustomersTable customers={$data} />
	{/if}
</div>

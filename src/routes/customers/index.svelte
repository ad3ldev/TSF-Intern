<script context="module">
	import CustomersTable from "./CustomersTable.svelte";
	import dbStore from "$lib/stores/db.js";
	const [data, reading, writing, error, get, set] = dbStore("customers", "*");
	get();
</script>

<div>
	{#if $reading}
		<p>Loading</p>
	{:else if $error}
		<p>error</p>
	{:else}
		<CustomersTable customers={$data} />
	{/if}
</div>

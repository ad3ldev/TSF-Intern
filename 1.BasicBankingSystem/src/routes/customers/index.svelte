<script context="module">
	import CustomersTable from "./CustomersTable.svelte";
	import dbStore from "$lib/stores/db.js";
	import Loading from "$lib/components/Loading.svelte";
	const [data, reading, error, get] = dbStore();
	get("customers", "*");
</script>

<div>
	<Loading showLoading={$reading} />
	{#if $error}
		<p>error</p>
	{:else if !$reading && !$error}
		<CustomersTable customers={$data} />
	{/if}
</div>

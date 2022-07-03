<script context="module">
	import TransfersTable from "./TransfersTable.svelte";
	import dbStore from "$lib/stores/db.js";
	const [data, loading, error, get] = dbStore("transfers", "*");
</script>

<div>
	<h1>Transfers</h1>
	{#if $loading}
		<p>Loading</p>
	{:else if $error}
		<p>error</p>
	{:else}
		<TransfersTable transfers={$data} />
	{/if}
</div>

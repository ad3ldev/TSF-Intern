<script context="module">
	import TransfersTable from "./TransfersTable.svelte";
	import dbStore from "$lib/stores/db.js";
	const [data, reading, error, get] = dbStore();
	get("transfers", "*");
</script>

<div>
	{#if $reading}
		<p>Loading</p>
	{:else if $error}
		<p>error</p>
	{:else}
		<TransfersTable transfers={$data} />
	{/if}
</div>

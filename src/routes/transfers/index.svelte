<script context="module">
	import TransfersTable from "./TransfersTable.svelte";
	import dbStore from "$lib/stores/db.js";
	import Loading from "$lib/components/Loading.svelte";
	const [data, reading, error, get] = dbStore();
	get("transfers", "*");
</script>

<div>
	<Loading showLoading={$reading} />
	{#if $error}
		<p>error</p>
	{:else if !$reading && !$error}
		<TransfersTable transfers={$data} />
	{/if}
</div>

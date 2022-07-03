<script contex="module">
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

<div>
	{#if $loading}
		<p>Loading</p>
	{:else if $error}
		<p>error</p>
	{:else}
		<h1>{$data[0].name}</h1>
	{/if}
</div>

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

{#if $reading}
	<p>Loading</p>
{:else if $error}
	<p>error</p>
{:else}
	<button>
		<a href={`../${id}`}>Back</a>
	</button>
	<h1>{$data[0].current_balance}</h1>
{/if}

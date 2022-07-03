<script context="module">
	import supabase from "$lib/db.js";
	export async function load() {
		let { data: transfers, error } = await supabase
			.from("transfers")
			.select("*");
		return {
			props: {
				transfers,
			},
		};
	}
</script>

<script>
	import TransfersTable from "$lib/components/transfersTable.svelte";
	export let transfers;
</script>

<div>
	<h1>Transfers</h1>
	<TransfersTable {transfers} />
</div>

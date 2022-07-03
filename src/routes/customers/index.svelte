<script context="module">
	import supabase from "$lib/db.js";
	export async function load() {
		let { data: customers, error } = await supabase
			.from("customers")
			.select("*");
		return {
			props: {
				customers,
			},
		};
	}
</script>

<script>
	import CustomersTable from "$lib/components/CustomersTable.svelte";
	export let customers;
</script>

<div>
	<h1>Customers</h1>
	<CustomersTable {customers} />
</div>

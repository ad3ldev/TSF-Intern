<script context="module">
	export const prerender = false;
</script>

<script>
	export let customers;
</script>

{#if customers.length == 0}
	<h2>No customers</h2>
{:else}
	<table>
		<thead>
			<tr>
				<th>Account</th>
				<th>Name</th>
				<th>Balance</th>
				<th>Country</th>
			</tr>
		</thead>
		<tbody>
			{#each customers as customer (customer.account_num)}
				<tr>
					<td>{customer.account_num}</td>
					<td>{customer.name}</td>
					<td>{customer.current_balance}</td>
					<td>{customer.country}</td>
				</tr>
			{/each}
		</tbody>
	</table>
{/if}

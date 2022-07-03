<script>
	export let customers;
</script>

<table>
	<thead>
		<tr>
			<th>Account</th>
			<th>Name</th>
			<th>Address</th>
			<th>Phone</th>
			<th>Email</th>
			<th>Balance</th>
			<th>Country</th>
		</tr>
	</thead>
	<tbody>
		{#each customers as customer (customer.account_num)}
			<tr>
				<td>{customer.account_num}</td>
				<td>{customer.name}</td>
				<td>{customer.address}</td>
				<td>{customer.phone}</td>
				<td>{customer.email}</td>
				<td>{customer.current_balance}</td>
				<td>{customer.country}</td>
			</tr>
		{/each}
	</tbody>
</table>

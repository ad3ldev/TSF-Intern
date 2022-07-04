<script context="module">
	export const prerender = false;
</script>

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
				<td
					><a href={`/customers/${customer.account_num}`}
						>{customer.account_num}</a
					></td
				>
				<td
					><a href={`/customers/${customer.account_num}`}
						>{customer.name}</a
					></td
				>
				<td
					><a href={`/customers/${customer.account_num}`}
						>{customer.address}</a
					></td
				>
				<td
					><a href={`/customers/${customer.account_num}`}
						>{customer.phone}</a
					></td
				>
				<td
					><a href={`/customers/${customer.account_num}`}
						>{customer.email}</a
					></td
				>
				<td
					><a href={`/customers/${customer.account_num}`}
						>{customer.current_balance}</a
					></td
				>
				<td
					><a href={`/customers/${customer.account_num}`}
						>{customer.country}</a
					></td
				>
			</tr>
		{/each}
	</tbody>
</table>

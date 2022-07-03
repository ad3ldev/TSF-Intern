<script>
	export let transfers;
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
		{#each transfers as transfer (transfer.tranfer_id)}
			<tr>
				<td>{transfer.tranfer_id}</td>
				<td>{transfer.from_account}</td>
				<td>{transfer.address}</td>
				<td>{transfer.to_account}</td>
				<td>{transfer.amount}</td>
				<td>{transfer.date}</td>
				<td>{transfer.time}</td>
			</tr>
		{/each}
	</tbody>
</table>

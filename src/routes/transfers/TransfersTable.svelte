<script context="module">
	export const prerender = false;
</script>

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
				<td><a href="/">{transfer.tranfer_id}</a></td>
				<td><a href="/">{transfer.from_account}</a></td>
				<td><a href="/">{transfer.address}</a></td>
				<td><a href="/">{transfer.to_account}</a></td>
				<td><a href="/">{transfer.amount}</a></td>
				<td><a href="/">{transfer.date}</a></td>
				<td><a href="/">{transfer.time}</a></td>
			</tr>
		{/each}
	</tbody>
</table>

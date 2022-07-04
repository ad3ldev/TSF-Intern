<script context="module">
	export const prerender = false;
</script>

<script>
	export let transfers;
</script>

{#if transfers.length == 0}
	<h2>No transfers</h2>
{:else}
	<table>
		<thead>
			<tr>
				<th>Transfer</th>
				<th>From Account Num</th>
				<th>To Account Num</th>
				<th>Amount</th>
			</tr>
		</thead>
		<tbody>
			{#each transfers as transfer (transfer.tranfer_id)}
				<tr>
					<td><a href="/">{transfer.tranfer_id}</a></td>
					<td><a href="/">{transfer.from_account}</a></td>
					<td><a href="/">{transfer.to_account}</a></td>
					<td><a href="/">{transfer.amount}</a></td>
				</tr>
			{/each}
		</tbody>
	</table>
{/if}

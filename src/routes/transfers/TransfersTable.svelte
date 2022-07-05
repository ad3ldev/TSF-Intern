<script context="module">
	export const prerender = false;
</script>

<script>
	export let transfers;
</script>

{#if transfers.length == 0}
	<h2>No transfers</h2>
{:else}
	<div class="table">
		<div class="th">Transfer</div>
		<div class="th">From Account</div>
		<div class="th">To Account</div>
		<div class="th">Amount</div>
		{#each transfers as transfer (transfer.tranfer_id)}
			<a class="tr" href={`/transfers/${transfer.tranfer_id}`}>
				<div class="td">{transfer.tranfer_id}</div>
				<div class="td">{transfer.from_customer}</div>
				<div class="td">{transfer.to_customer}</div>
				<div class="td">{transfer.amount}</div>
			</a>
		{/each}
	</div>
{/if}

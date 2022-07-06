<script context="module">
	export const prerender = false;
</script>

<script>
	import { slide, scale } from "svelte/transition";
	export let customers;
</script>

{#if customers.length == 0}
	<h2>No customers</h2>
{:else}
	<div class="table" in:slide out:scale|local>
		<div class="th">Account</div>
		<div class="th">Name</div>
		<div class="th">Balance</div>
		<div class="th">Country</div>
		{#each customers as customer (customer.account_num)}
			<a
				sveltekit:prefetch
				class="tr"
				href={`/customers/${customer.account_num}`}
			>
				<div class="td">{customer.account_num}</div>
				<div class="td">{customer.name}</div>
				<div class="td">{customer.current_balance}</div>
				<div class="td">{customer.country}</div>
			</a>
		{/each}
	</div>
{/if}

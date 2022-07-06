<script>
	import dbStore from "$lib/stores/db.js";
	import { page } from "$app/stores";
	import Card from "$lib/components/Card.svelte";
	import Button from "$lib/components/Button.svelte";

	let id = $page.params.id;
	const [data, reading, error, get] = dbStore();
	get("customers", "*", "account_num", `${id}`);
</script>

<Card>
	<div class="customer">
		{#if $reading}
			<p>Loading</p>
		{:else if $error}
			<p>error</p>
		{:else}
			<div class="details">
				<h1>{$data[0].name}</h1>
				<ul>
					<li class="item"
						><p>Acount Number</p>
						<p>{$data[0].account_num}</p>
					</li>
					<li class="item"
						><p>Address</p> <p>{$data[0].address}</p></li
					>
					<li class="item"><p>Phone</p> <p>{$data[0].phone}</p></li>
					<li class="item"><p>Email</p><p>{$data[0].email}</p> </li>
					<li class="item"
						><p>Country:</p> <p>{$data[0].country}</p></li
					>
				</ul>
				<div class="money">
					<p>Current Balance</p>
					<p>
						{$data[0].current_balance}
					</p>
					<a href={`./${id}/transfer`}><Button>Transfer</Button></a>
				</div>
			</div>
		{/if}
	</div>
</Card>

<style lang="scss">
	h1 {
		padding: 0;
		margin: 0;
	}
	.customer {
		display: grid;
		padding: 0 10%;
		width: 100%;
		height: 100%;
		box-sizing: border-box;
	}
	.details {
		display: grid;
		justify-items: center;
		align-items: center;
		grid-template-rows: 1fr 4fr 4fr;
	}
	ul {
		margin: 0;
		padding: 0;
		list-style-type: none;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;

		@media screen and (min-width: 650px) {
			.item {
				padding: 0;
				margin: 0;
				align-items: center;
				p {
					padding: 0;
					margin: 0;
					word-break: break-all;
					overflow: hidden;
				}
				:first-child {
					color: red;
					word-break: normal;
				}
				display: grid;
				grid-template-columns: 1fr 2fr;
			}
		}
		@media screen and (max-width: 650px) {
			li {
				padding: 0;
			}
			.item {
				padding: 0;
				margin: 0;
				align-items: center;
				p {
					padding: 0;
					margin: 0;
					word-break: break-all;
					overflow: hidden;
				}
				:first-child {
					color: red;
					word-break: normal;
				}
				display: grid;
				grid-template-rows: 1fr 1fr;
			}
		}
	}
	a {
		text-decoration: none;
	}
</style>

<script>
	import dbStore from "$lib/stores/db.js";
	import { page } from "$app/stores";
	import Card from "$lib/components/Card.svelte";
	import Button from "$lib/components/Button.svelte";
	import Loading from "$lib/components/Loading.svelte";

	let id = $page.params.id;
	const [data, reading, error, get] = dbStore();
	get("customers", "*", "account_num", `${id}`);
</script>

<Loading showLoading={$reading} />
<div class="back">
	<a href="./">
		<Button>Back</Button>
	</a>
</div>
<Card>
	<div class="customer">
		{#if $error}
			<p>error</p>
		{:else if !$reading && !$error}
			<h1>{$data[0].name}</h1>
			<div class="details">
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
						><p>Country</p> <p>{$data[0].country}</p></li
					>
					<li class="money">
						<p class="title">Current Balance</p>
						<p class="balance">
							{$data[0].current_balance}
						</p>
						<a sveltekit:prefetch href={`./${id}/transfer`}
							><Button>Transfer</Button>
						</a>
					</li>
				</ul>
			</div>
		{/if}
	</div>
</Card>

<style lang="scss">
	.back {
		margin: 1rem;
	}
	h1 {
		padding: 0;
		margin: 1rem 0;
	}
	.customer {
		display: grid;
		grid-template-rows: 1fr 9fr;
		justify-items: center;
		align-items: center;
		padding: 0 10%;
		width: 100%;
		height: 100%;
		box-sizing: border-box;
	}
	.details {
		padding: 1rem;
		display: grid;
		justify-items: center;
		align-items: center;
		width: 100%;
		height: 100%;
	}
	ul {
		margin: 0;
		padding: 0;
		height: 100%;
		width: 100%;
		list-style-type: none;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;

		.money {
			display: flex;
			width: 100%;
			align-items: center;
			justify-content: space-between;
			padding-bottom: 1rem;

			.balance {
				font-size: 1.5rem;
				font-weight: bold;
				padding: 0 1rem;
			}
			.title {
				color: hsl(214, 72%, 58%);
			}
		}

		@media screen and (min-width: 650px) {
			.item {
				padding: 0.25rem;
				margin: 0;
				p {
					padding: 0;
					margin: 0;
					word-break: break-all;
					overflow: hidden;
				}
				:first-child {
					color: hsl(214, 72%, 58%);
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
					color: hsl(214, 72%, 38%);
					word-break: normal;
				}
				display: grid;
				grid-template-rows: 1fr 1fr;
			}
			.money {
				flex-direction: column;
				align-items: start;
				a,
				.balance {
					align-self: center;
				}
			}
		}
	}
	a {
		text-decoration: none;
	}
</style>

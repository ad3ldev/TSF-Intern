<script>
	import dbStore from "$lib/stores/db.js";
	import { page } from "$app/stores";
	import Card from "$lib/components/Card.svelte";
	import Loading from "$lib/components/Loading.svelte";
	import Button from "$lib/components/Button.svelte";

	let id = $page.params.id;
	const [data, reading, error, get] = dbStore();
	get("transfers", "*", "tranfer_id", `${id}`);
</script>

<Loading showLoading={$reading} />
<div class="back">
	<a href="./">
		<Button>Back</Button>
	</a>
</div>
<Card>
	<div class="transfer">
		{#if $error}
			<p>error</p>
		{:else if !$reading && !$error}
			<div class="details">
				<h1>Transfer ID: {$data[0].tranfer_id}</h1>
				<ul>
					<li class="item"
						><p>From Account</p>
						<p>{$data[0].from_customer}</p>
					</li>
					<li class="item"
						><p>To Account</p> <p>{$data[0].to_customer}</p></li
					>
					<li class="item"><p>Date</p> <p>{$data[0].date}</p></li>
					<li class="item"><p>Time</p><p>{$data[0].time}</p> </li>
					<li class="money">
						<p class="title">Amount transfered</p>
						<p class="balance">
							{$data[0].amount}
						</p>
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
	.transfer {
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
		width: 100%;
		height: 100%;
		padding: 1rem;
		display: grid;
		justify-items: center;
		align-items: center;
	}
	ul {
		display: flex;
		margin: 0;
		padding: 1rem;
		height: 100%;
		width: 100%;
		list-style-type: none;
		flex-direction: column;
		justify-content: space-evenly;

		.money {
			display: flex;
			width: 100%;
			flex-direction: column;
			justify-content: space-between;
			padding-bottom: 1rem;

			.balance {
				padding: 0;
				margin: 0;
				font-size: 2.5rem;
				font-weight: bold;
				align-self: center;
			}
			.title {
				color: hsl(214, 72%, 58%);
				padding: 1rem 0;
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

<div class="card">
	<slot />
</div>

<style lang="scss">
	$percent: 75%;
	$other: 12.5%;
	.card {
		border-radius: 1rem;
		box-shadow: 0rem 0rem 1rem hsl(0, 0%, 75%);
		height: $percent;
		width: $percent;
		left: $other;
		top: $other;
		margin-top: 2.5em;
		position: fixed;
		box-sizing: border-box;
	}
</style>

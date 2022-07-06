<button>
	<slot />
</button>

<style lang="scss">
	button {
		padding: 1rem;
		background-color: #1b58a8;
		color: white;
		border: none;
		border-radius: 0.5rem;
		box-sizing: border-box;
		box-shadow: 0 0rem 0.5rem hsl(0, 0%, 75%);
		cursor: pointer;
		transition: scale 0.2s ease;
	}
	@media (hover: hover) and (pointer: fine) {
		button:hover {
			scale: 1.15;
			transition: scale 0.2s ease;
		}
	}
	button:active {
		scale: 0.85;
		transition: scale 0.2s ease;
	}
</style>

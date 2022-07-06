<script>
	import "../app.scss";
	import Navbar from "$lib/components/Navbar.svelte";
</script>

<Navbar />
<main>
	<slot />
</main>

<style lang="scss">
	@import url("https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap");
	:global(html, body) {
		font-family: "Roboto Mono", monospace;
		padding: 0;
		margin: 0;
		font-size: clamp(0.5rem, 0.0385rem + 2.3077vw, 1rem);
	}
	main {
		height: 100%;
		width: 100%;
	}
</style>

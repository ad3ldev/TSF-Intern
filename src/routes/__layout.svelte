<script>
	import "../app.scss";
	import Navbar from "$lib/components/Navbar.svelte";
</script>

<Navbar />
<main>
	<slot />
</main>

<style lang="scss">
	* {
		height: calc(100vh - 6.5rem);
		box-sizing: border-box;
		overflow: hidden;
	}
</style>

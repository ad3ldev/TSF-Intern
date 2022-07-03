// Button.stories.js

import Navbar from "../components/Navbar.svelte";

export default {
	/* 👇 The title prop is optional.
	 * See https://storybook.js.org/docs/svelte/configure/overview#configure-story-loading
	 * to learn how to generate automatic titles
	 */
	title: "Navbar",
	component: Navbar,
};

export const Default = () => ({
	Component: Navbar,
	props: {
		primary: true,
		label: "Navbar",
	},
});

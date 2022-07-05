import { writable } from "svelte/store";
import supabase from "$lib/supabase.js";
export default function () {
	const validating = writable(false);
	const error = writable(false);
	const data = writable({});
	async function get(table, column, row, id) {
		validating.set(true);
		error.set(false);
		try {
			const response = await supabase
				.from(table)
				.select(column)
				.eq(row, id);
			if (response.data.length == 0) {
				throw "No a correct customer";
			} else {
				data.set(response.data);
			}
		} catch (e) {
			error.set(e);
		}
		validating.set(false);
	}
	return [data, validating, error, get];
}

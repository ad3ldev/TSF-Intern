import { writable } from "svelte/store";
import supabase from "$lib/supabase.js";
export default function (table, column, row, id) {
	const loading = writable(false);
	const error = writable(false);
	const data = writable({});
	async function get() {
		loading.set(true);
		error.set(false);
		try {
			if (row == undefined) {
				const response = await supabase.from(table).select(column);
				data.set(response.data);
			} else {
				const response = await supabase
					.from(table)
					.select(column)
					.eq(row, id);
				data.set(response.data);
			}
		} catch (e) {
			error.set(e);
		}
		loading.set(false);
	}
	get();
	return [data, loading, error, get];
}

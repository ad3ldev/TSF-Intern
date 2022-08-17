import { writable } from "svelte/store";
import supabase from "$lib/supabase.js";
export default function () {
	const reading = writable(false);
	const error = writable(false);
	const data = writable({});
	async function get(table, column, row, id) {
		reading.set(true);
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
		reading.set(false);
	}
	return [data, reading, error, get];
}

function pick_beast(beasts1, beasts0) {
	var most_numerous = beast_names.reduce(function (acc2, good) {
		if (beasts1[good] > acc2.quantity && !acc2.used[good]) {
			acc2.quantity = beasts1[good];
			acc2.bname = good;
		}
		return acc2;
	}, {quantity:0,used:beasts0});
	if (most_numerous.quantity > 0) {
		beasts1[most_numerous.bname]--;
		beasts0[most_numerous.bname] = 1;
	} else {
		return false;
	}
	return true;	
}
function beast_counter(beasts1) {
	var beasts0 = {};
	for (var i = 0; i < 3; i++) {
		if (!pick_beast(beasts1, beasts0))
			return false;
	}
	return true;
}
var beast_checker = {
	contains: function (tuple) {
		function check_item(acc, item) {
			acc &= ((tuple[item] <= this[item]) ? 1 : 0);
			return acc;
		}
		function remove_item(acc, item) {
			if (this[item]) {
				this[item] -= tuple[item];
			}
		}
		var keys = Object.keys(tuple);
		var found = keys.reduce(check_item.bind(this), 1);
		if (found) {
			keys.reduce(remove_item.bind(this), 1);
		}
		return found;
	},
};
var beast_memos = {
	1: function (beast_cards, beasts) {
		var tuples = [
			{unicorn: 3},
			{unicorn: 1, spider: 1, sea_serpent: 1},
			{sea_serpent: 1, phoenix: 1},
			{phoenix: 1, spider: 1},
			{unicorn: 2},
			{phoenix: 1},
			{unicorn: 1}
		], tuples_score = [12, 9, 6, 6, 6, 2, 1], tuples_size = [3, 3, 2, 2, 2, 1, 1];
		var beasts0 = Object.assign(beast_checker, beasts);
		function find_tuple() {
			var has_tuple = 0, i = 0;
			while(i < tuples.length && !(has_tuple = beasts0.contains(tuples[i]))) {
				i++;
			}
			return has_tuple ? i : -1;
		}
		var total_points = 0, points, num_left = beast_cards.length;
		while (true) {
			var indtuple = find_tuple();
			if (indtuple >= 0) {
				points = tuples_score[indtuple];
				num_left -= tuples_size[indtuple];
			} else {
				points = 0;
			}
			total_points += points;
			console.log(beasts0);
			if (!points || !num_left)
				return total_points;
		}
	},
	3: function (beast_cards, beasts) {
		var threesomes = [
			{spider: 2, sea_serpent: 1},
			{phoenix: 2, spider: 1},
			{unicorn: 2, phoenix: 1},
			{sea_serpent: 2, unicorn: 1}
		];

		var beasts1 = Object.assign(beast_checker, beasts);
		function find_threesome() {
			var has_threesome = 0, i = 0;
			while(i < threesomes.length && !(has_threesome = beasts1.contains(threesomes[i]))) {
				i++;
			}
			return has_threesome;			
		}
		// var num_left = beast_cards.length, 
		var tens = 0;
		while (find_threesome()) {
			console.log(beasts1);
			// num_left -= 3;
			tens++;
		}
		// how many pairs may be left after removing threesomes?
		return ((beast_cards.length - tens * 3) / 2 | 0)*5 + tens*10;
	},
	5: function (beast_cards) {
		var indices = {
			phoenix: 0,
			sea_serpent: 1,
			spider: 2,
			unicorn: 3
		};
		var matrix = [
			[3, 3, 4, 5],
			[5, 3, 3, 4],
			[4, 5, 3, 3],
			[3, 4, 5, 3]
		];
		var points = 0, beasts = [cards_deck[beast_cards[0]][3]];
		console.log(beast_cards);
		for (var i = 1; i < beast_cards.length; i++) {
			beasts.push(cards_deck[beast_cards[i]][3]);
			points += matrix[indices[cards_deck[beast_cards[i - 1]][3]]][indices[cards_deck[beast_cards[i]][3]]];
		}
		console.log(beasts);
		return points;
	}
}

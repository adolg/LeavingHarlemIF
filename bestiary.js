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
var beast_memos = {
	3: function (beast_cards, beasts) {
		var threesomes = [
			{spider: 2, sea_serpent: 1},
			{phoenix: 2, spider: 1},
			{unicorn: 2, phoenix: 1},
			{sea_serpent: 2, unicorn: 1}
		];

		var beasts1 = Object.assign({
			contains: function (threesome) {
				function check_item(acc, item) {
					acc &= ((threesome[item] <= this[item]) ? 1 : 0);
					return acc;
				}
				function remove_item(beasts, item) {
					if (beasts[item]) {
						beasts[item] -= threesome[item];
					}
				}
				var keys = Object.keys(threesome);
				var found = keys.reduce(check_item.bind(this), 1);
				if (found) {
					remove_item(this, keys[0]);
					remove_item(this, keys[1]);
				}
				return found;
			},
		}, beasts);
		function find_threesome() {
			var has_threesome = 0, i = 0;
			while(i < 4 && !(has_threesome = beasts1.contains(threesomes[i]))) {
				i++;
			}
			return has_threesome;			
		}
		var has_threesome1 = beast_cards.length >= 3 ? find_threesome() : 0;
		console.log(beasts1);
		var has_threesome2 = beast_cards.length >= 6 ? find_threesome() : 0;
		console.log(beasts1);
		var has_threesome3 = beast_cards.length >= 9 ? find_threesome() : 0;
		console.log(beasts1);
		var tens = has_threesome1 + has_threesome2 + has_threesome3;
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

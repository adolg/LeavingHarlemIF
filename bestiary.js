var beast_names = ["unicorn","phoenix","spider","sea_serpent"];

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
function beast_counter(beasts1, num_beasts) {
	var beasts0 = {};
	for (var i = 0; i < num_beasts; i++) {
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
	clean: function () {
		var checker = this;
		beast_names.reduce(function(acc, item) {
			delete checker[item];
			// console.log(item);
			return acc;
		}, 0);		
	}
};
function memo(tuples, beasts, tuples_score, tuples_size) {
	// clean the beast_checker global object before reuse
	beast_checker.clean();

	var beasts0 = Object.assign(beast_checker, beasts);
	console.log(beasts0);
	function find_tuple() {
		var has_tuple = 0, i = 0;
		while(i < tuples.length && !(has_tuple = beasts0.contains(tuples[i]))) {
			i++;
		}
		return has_tuple ? i : -1;
	}
	var total_points = 0, points, num_left = Object.keys(beasts).reduce(function(acc, item) {
		acc += beasts[item];
		return acc;
	}, 0);
	while (true) {
		var indtuple = find_tuple();
		if (indtuple >= 0) {
			points = tuples_score[indtuple];
			num_left -= tuples_size[indtuple];
		} else {
			points = 0;
		}
		total_points += points;
		console.log("memo:")
		console.log(beasts);
		console.log(beasts0);
		// var beasts1 = Object.assign({}, beasts0);
		if (!points || !num_left) {
			return [total_points, beasts0];
		}
	}
}
function memo1(tuples, beasts) {
	return memo(tuples, beasts, [12, 9, 6, 6, 6, 2, 1], [3, 3, 2, 2, 2, 1, 1])[0];
}

var beast_memos = {
	1: memo1.bind(this, [
		{unicorn: 3},
		{unicorn: 1, spider: 1, sea_serpent: 1},
		{sea_serpent: 1, phoenix: 1},
		{phoenix: 1, spider: 1},
		{unicorn: 2},
		{phoenix: 1},
		{unicorn: 1}
	]),
	2: memo1.bind(this, [
		{sea_serpent: 3},
		{unicorn: 1, phoenix: 1, sea_serpent: 1},
		{sea_serpent: 2},
		{phoenix: 1, spider: 1},
		{unicorn: 1, spider: 1},
		{spider: 1},
		{sea_serpent: 1}
	]),
	3: function (beasts) {
		var threesomes = [
			{spider: 2, sea_serpent: 1},
			{phoenix: 2, spider: 1},
			{unicorn: 2, phoenix: 1},
			{sea_serpent: 2, unicorn: 1}
		];
		beast_checker.clean();

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
	4: function (beasts) {
		var points = 0, beasts1 = [Object.assign({}, beasts), Object.assign({}, beasts)];
		if (beast_counter(beasts1[beasts1.length - 1], 4)) {
			points += 12;
			beasts1.push(Object.assign({}, beasts1[beasts1.length - 1]));
			if (beast_counter(beasts1[beasts1.length - 1], 4)) {
				points += 12;
				beasts1.push(Object.assign({}, beasts1[beasts1.length - 1]));
			} else {
				beasts1.pop();
			}
		} else {
			beasts1.pop();
		}
		console.log(points);
		console.log(beasts1[beasts1.length - 1]);
		console.log(beasts1);
		// beasts1.push(Object.assign({}, beasts1[beasts1.length - 1]));
		var memo_points = memo([
			{spider: 2},
			{phoenix: 2},
			{unicorn: 2},
			{sea_serpent: 2}
		], beasts1[beasts1.length - 1], [6, 6, 6, 6], [2, 2, 2, 2]);
		if (!memo_points) {
			// beasts1.pop();
		}
		points += memo_points[0];
		console.log(points);
		console.log(memo_points[1]);
		beasts1.push(Object.assign({}, memo_points[1]));
		beasts1.push(Object.assign({}, memo_points[1]));
		if (beast_counter(beasts1[beasts1.length - 1], 3)) {
			points += 8;
			beasts1.push(Object.assign({}, beasts1[beasts1.length - 1]));
			if (beast_counter(beasts1[beasts1.length - 1], 3)) {
				points += 8;
				beasts1.push(Object.assign({}, beasts1[beasts1.length - 1]));
				if (beast_counter(beasts1[beasts1.length - 1], 3)) {
					points += 8;
					beasts1.push(Object.assign({}, beasts1[beasts1.length - 1]));
				} else {
					beasts1.pop();
				}
			} else {
				beasts1.pop();
			}
		} else {
			beasts1.pop();
		}
		console.log(points);
		console.log(beasts1[beasts1.length - 1]);
		beasts1.push(Object.assign({}, beasts1[beasts1.length - 1]));
		if (beast_counter(beasts1[beasts1.length - 1], 2)) {
			points += 4;
		} else {
			beasts1.pop();
		}
		console.log(points);
		points += beast_counter(beasts1[beasts1.length - 1], 1) ? 2 : 0;
		console.log(points);
		return points;
	},
	5: function (beasts, beast_cards) {
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
		var points = 0, beasts1 = [cards_deck[beast_cards[0]][3]];
		console.log(beast_cards);
		for (var i = 1; i < beast_cards.length; i++) {
			beasts1.push(cards_deck[beast_cards[i]][3]);
			points += matrix[indices[cards_deck[beast_cards[i - 1]][3]]][indices[cards_deck[beast_cards[i]][3]]];
		}
		console.log(beasts1);
		return points;
	}
}

(
SynthDef ("xine", {arg out = 0, freq = 150, pan = 0, rate = 1, amp = 0.2, gate = 1, mul = 2;
	var snd, env;
	env = Env.adsr(
		attackTime:0.1,
		decayTime: 0.8,
		sustainLevel: 1,
		peakLevel: 3,
		curve:1,)
		.kr(gate: gate, doneAction:2);
	snd = HPF.ar(
			in: Saw.ar(
			freq: freq,
			mul: mul,
		));
	snd = snd*env;
	snd = BPF.ar(
		in: Saw.ar(
			freq: freq,
			mul: mul));
	snd = Mix.ar(snd);
		Out.ar(0,Pan2.ar(snd, pan, amp));
}).add;
)

(
Synth (\xine);
)



(
Pbind(
	\instrument, \xine,
	\degree, Pseq([0,2,4,6,8],inf),
	\dur, 0.3,
	\mul, 1,
	\amp, 0.2,
	\legato, 3,
).play;
)

(
Pbind(
	\instrument, \xine,
	\degree, Prand([0,-2,-2,-4,0],inf),
	\dur, 1,
	\mul, 2,
	\delay, 1,
	\amp, 0.2,
	\legato, 1,
).play;
)

(
Pbind(
	\instrument, \xine,
	\degree, Prand([0,-8,-7,-6,-5],inf),
	\dur, 0.28,
	\mul, 1,
	\amp, 0.2,
	\legato, 1,
).play;
)
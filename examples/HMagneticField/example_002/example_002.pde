HDrawablePool pool;
HMagneticField field;
HColorPool colors;

void setup() {
	size(640,640);

	H.init(this).background(#202020);
	smooth();

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #CCCCCC).fillOnly();

	field = new HMagneticField()
		.addPole(490, 175,  5) // x, y, north polarity / strength = +5 / repel

		.addPole(150, 490, -2) // x, y, south polarity / strength = -2 / attract
	;

	pool = new HDrawablePool(930);
	pool.autoAddToStage()
		.add(
			new HShape("arrow.svg")
			.enableStyle(false)
			.anchorAt(H.CENTER)
		)

		.colorist(colors)

		.layout(
			new HGridLayout()
			.startX(5)
			.startY(15)
			.spacing(21,21)
			.cols(31)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d.noStroke();
					field.addTarget(d);
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	H.drawStage();
}


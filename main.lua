Life = require "life"

life={}

local TOTALANCHO=60;

function love.load()

	love.window.setMode(TOTALANCHO*10,TOTALANCHO*10)

	math.randomseed(os.time())

	local i,ii,ANCHO,tabla;

	--life=Life.load(60,60,10,10,{{0,0,1},{1,0,1},{0,1,1}});
	--life=Life.load(60,60,10,10,{{1,1,0,0,1},{1,0,0,1,0},{1,0,0,1,1},{0,0,1,0,0},{1,0,1,1,1}});
	tabla={};
	ANCHO=math.random(TOTALANCHO-1)+1;

	i=1;

	while i <= ANCHO do

		ii=1;

		tabla[i]={}

		while ii <= ANCHO do

			if math.random() > 0.5 then

				tabla[i][ii]=0;

			else

				tabla[i][ii]=1;

			end

			ii=ii+1;

		end;

		i=i+1;

	end

	life=Life.load(TOTALANCHO,TOTALANCHO,math.floor(TOTALANCHO/2-ANCHO/2),math.floor(TOTALANCHO/2-ANCHO/2),tabla);

end

function love.keypressed(key)

	love.load();

end

function love.update()

	life.update();

end

function love.draw()

	life.draw();

end

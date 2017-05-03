local Life={}

local ANCHO=10;
local ALTO=10;
local vida={2,3};
local nace={3};

local speed=5;

function Life.load(totalx,totaly,x,y,mylist)

	local self={}

	local field = {};

	local i,ii,i2,ii2;

	self.frame=0;

	i=1;

	while(i <= totalx) do

		ii=1;

		field[i]={};

		while ii <= totaly do

			field[i][ii]=0;

			ii=ii+1;

		end

		i=i+1;

	end

	i=x;

	i2=1;
	
	while i2 <= table.getn(mylist) do

		ii2=1;
		ii=y;

		while ii2 <= table.getn(mylist[i2]) do

			field[i][ii]=mylist[i2][ii2];

			ii2=ii2+1;
			ii=ii+1;

		end

		i2=i2+1;
		i=i+1;

	end

	function self.cuenta(i,ii,fieldaux)

		local i2,ii2,numero;

		numero = 0;

		i2=i-1;

		while i2 <= i+1 do

			ii2=ii-1;

			while ii2 <= ii+1 do

				if ii2 ~= ii or i2 ~= i  then

					if i2 ~= 0 and ii2 ~=0 then

						if i2 <= table.getn(fieldaux) and ii2 <= table.getn(fieldaux[i2]) then

							if fieldaux[i2][ii2] == 1 then

								numero=numero+1;

							end

						elseif i2 <= table.getn(fieldaux) then

							if fieldaux[i2][1] == 1 then

								numero=numero+1;

							end

						elseif ii2 <= table.getn(fieldaux[1]) then

							if fieldaux[1][ii2] == 1 then

								numero=numero+1;

							end


						else

							if fieldaux[1][1] == 1 then

								numero=numero+1;

							end


						end

					else

						if ii2 == 0 and i2 == 0 then

							if fieldaux[table.getn(fieldaux)][table.getn(fieldaux[1])] == 1 then

								numero=numero+1;

							end

						elseif ii2 == 0 then

							if i2 <= table.getn(fieldaux) then

								if fieldaux[i2][table.getn(fieldaux[i2])] == 1 then

									numero=numero+1;

								end

							else

								if fieldaux[1][table.getn(fieldaux[1])] == 1 then

									numero=numero+1;

								end
							end

						else

							if ii2 <= table.getn(fieldaux[1]) then

								if fieldaux[table.getn(fieldaux)][ii2] == 1 then
	
									numero=numero+1;

								end

							else

								if fieldaux[table.getn(fieldaux)][1] == 1 then
	
									numero=numero+1;

								end

							end

						end

					end

				end

				ii2=ii2+1;

			end

			i2=i2+1;

		end

		return numero;

	end

	function self.update()

		local i,ii,iii,numero,fieldaux;

		self.frame=self.frame+1;

		if self.frame%speed~=0 then

			return;

		end

		fieldaux={};

		i=1;

		while(i <= totalx) do

			ii=1;

			fieldaux[i]={};

			while ii <= totaly do

				fieldaux[i][ii]=field[i][ii];

				ii=ii+1;

			end

			i=i+1;

		end

		i=1;

		while(i <= totalx) do

			ii=1;

			while ii <= totaly do

				numero = self.cuenta(i,ii,fieldaux);

				iii=1;

				if field[i][ii] == 0 then

					while iii <= table.getn(nace) do

						if numero == nace[iii] then

							break;

						end

						iii=iii+1;

					end

					if iii <= table.getn(nace) then

						field[i][ii] = 1;

					end

				else

					while iii <= table.getn(vida) do

						if numero == vida[iii] then

							break;

						end

						iii=iii+1;

					end

					if iii > table.getn(vida) then

						field[i][ii]=0;

					end

				end

				if field[i][ii]>0 then

					love.graphics.rectangle("fill",i*ANCHO,ii*ANCHO,ANCHO,ALTO);

				end

				ii=ii+1;

			end

			i=i+1;

		end

		return;

	end

	function self.draw()

		local i,ii;

		i=1;

		while(i <= totalx) do

			ii=1;

			while ii <= totaly do

				if field[i][ii]>0 then

					love.graphics.rectangle("fill",i*ANCHO,ii*ANCHO,ANCHO,ALTO);

				end;

				ii=ii+1;

			end

			i=i+1;

		end

	end

	return self;

end

return Life;

shader_type canvas_item;

uniform vec4 original0 : source_color;
uniform vec4 original1 : source_color;
uniform vec4 original2 : source_color;
uniform vec4 original3 : source_color;

uniform vec4 replace0 : source_color;
uniform vec4 replace1 : source_color;
uniform vec4 replace2 : source_color;
uniform vec4 replace3 : source_color;

const float precision = 0.1;

vec4 replace_colors(vec4 color)
{
	vec4 original_colors[4] = vec4[4](original0, original1, original2, original3);
	vec4 replace_colors[4] = vec4[4](replace0, replace1, replace2, replace3);
	
	for(int i = 0; i < 4; i++)
	{
		if(distance(color, original_colors[i]) <= precision)
		{
			color = replace_colors[i];
		}
	}
	
	return color;
}

void fragment()
{
	COLOR = replace_colors(texture(TEXTURE, UV));
	// Called for every pixel the material is visible on.
	//vec4 color = texture(TEXTURE, UV);
	//
	//if(distance(color, original0) <= precision)
	//{
		//color = replace0;
	//}
	//
	//COLOR = color;
}

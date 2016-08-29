/* bunny.cpp */

#include "bunny.h"

void Bunny::_bind_methods() {

}

Bunny::Bunny() {

	gravity = 3;
	max_x = 640;
	min_x = 0;
	max_y = 480;
	min_y = 0;

	set_texture(ResourceLoader::load("res://wabbit_alpha.png"));

	float rand_x_velocity = Math::randf() * 10;
	float rand_y_velocity = Math::random(5, 10);
	velocity = Vector2(rand_x_velocity, rand_y_velocity);
	
	set_process(true);
}

void Bunny::_notification(int p_what) {

	if (p_what == NOTIFICATION_PROCESS) {

		Vector2 pos = get_pos();
		pos.x += velocity.x;
		pos.y += velocity.y;
		velocity.y += gravity;

		if (pos.x > max_x) {
			velocity.x *= -1;
			pos.x = max_x;
		} else if (pos.x < min_x) {
			velocity.x *= -1;
			pos.x = min_x;
		}
		
		if (pos.y > max_y) {
			velocity.y *= -0.8;
			pos.y = max_y;
			if (Math::randf() > 0.5) {
				velocity.y -= Math::randf() * 12;
			}


		} else if (pos.y < min_y) {
			velocity.y = 0;
			pos.y = min_y;
		}

		set_pos(pos);
	}
}
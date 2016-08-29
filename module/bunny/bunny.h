/* bunny.h */
#ifndef BUNNY_H
#define BUNNY_H

#include "scene/2d/sprite.h"

class Bunny : public Sprite {
    OBJ_TYPE(Bunny,Sprite);

	int gravity;
	int max_x;
	int min_x;
	int max_y;
	int min_y;
	Vector2 velocity;

protected:
    static void _bind_methods();
public:
    Bunny();
    void _notification(int p_what);
};

#endif
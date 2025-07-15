-- Class 表

local _class = {}
-- 对象数量
local lua_obj_count = 0

local LuaClass = function (className, super)
    --创建一个类，记录类的类名和父类
    local class = {_className = className, _super = super}

    -- 声明类的构造、析构函数
    class.__init = false
    class.__delete = false;

    _class[class] = class

    -- 继承父类成员
    if super then
        setmetatable(class,{__index = _class[super]})
    end

    -- New函数
    class.New = function (...)
        lua_obj_count = lua_obj_count + 1
        -- 记录自己的类
        local obj = {_class = class}
        setmetatable(obj,{__index = _class[class]})

        -- 调用构造函数
        do
            local create
            create = function (c,...)
                if c._super then
                    create(c._super,...)
                end
                if c.__init then
                    c.__init(obj,...)
                end
            end
            create(obj,...)
        end

        -- 注册delege函数
        obj.Delete = function (self)
            lua_obj_count = lua_obj_count - 1
            local now_super = self._class
            while now_super ~= nil do
                if now_super.__delete then
                    now_super.__delete(self)
                end
                now_super = now_super._super
            end
        end

        return obj
    end

    return class
end

return LuaClass
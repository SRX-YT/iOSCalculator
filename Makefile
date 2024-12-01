# Указываем компилятор
CXX = g++

# Указываем флаги компиляции
CXXFLAGS = -Wall -g

# Указываем флаги линковки
LDFLAGS = `sdl2-config --cflags --libs` -lGL -lGLU

# Указываем директорию с исходными файлами
SRC_DIR = src
# Указываем директорию для объектных файлов
OBJ_DIR = obj

IMGUI_DIR = include/imgui

SDL_DIR = include/SDL

# Указываем целевой исполняемый файл
TARGET = calculator

# Список исходных файлов
SRCS = $(IMGUI_DIR)/imgui_draw.cpp $(IMGUI_DIR)/imgui_impl_opengl3.cpp $(IMGUI_DIR)/imgui_impl_sdl2.cpp $(IMGUI_DIR)/imgui_stdlib.cpp $(IMGUI_DIR)/imgui_tables.cpp $(IMGUI_DIR)/imgui_widgets.cpp $(IMGUI_DIR)/imgui.cpp $(IMGUI_DIR)/imgui_demo.cpp $(SRC_DIR)/Main.cpp

# Генерируем список объектных файлов на основе исходных файлов
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS))

# Правило по умолчанию
all: $(TARGET)

# Правило для сборки исполняемого файла
$(TARGET): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

# Правило для компиляции .cpp файлов в .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Правило для очистки
clean:
	rm -rf $(OBJ_DIR)/*.o $(TARGET)

# Правило для полной очистки
fclean: clean
	rm -rf $(TARGET)

# Правило для перезапуска сборки
re: fclean all

.PHONY: all clean fclean re
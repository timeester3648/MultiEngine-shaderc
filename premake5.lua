include "../../premake/common_premake_defines.lua"

project "shaderc"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	targetname "%{prj.name}"
	inlining "Auto"

	defines {
		"ENABLE_OPT=true",
		"ENABLE_HLSL=true"
	}

	includedirs {
		"%{IncludeDir.glslang}",
		"%{IncludeDir.shaderc}",
		"%{IncludeDir.spirv_headers}",
		"%{IncludeDir.spirv_tools}/spirv_tools",

		"./libshaderc/include/",
		"./libshaderc_util/include",
		"./libshaderc/include/shaderc"
	}

	files {
		"./libshaderc/src/shaderc.cc",

		"./libshaderc_util/src/args.cc",
		"./libshaderc_util/src/compiler.cc",
		"./libshaderc_util/src/file_finder.cc",
		"./libshaderc_util/src/io_shaderc.cc",
		"./libshaderc_util/src/message.cc",
		"./libshaderc_util/src/resources.cc",
		"./libshaderc_util/src/shader_stage.cc",
		"./libshaderc_util/src/spirv_tools_wrapper.cc",
		"./libshaderc_util/src/version_profile.cc"
	}

	filter "action:vs*"
		disablewarnings { "4996", "4717" }
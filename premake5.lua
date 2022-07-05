include "../../premake/common_premake_defines.lua"

project "shaderc"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	targetname "%{prj.name}"
	inlining "Auto"

	defines {
		"ENABLE_OPT",
		"ENABLE_HLSL"
	}

	includedirs {
		"%{IncludeDir.glslang}",
		"%{IncludeDir.shaderc}",
		"%{IncludeDir.spirv_headers}",
		"%{IncludeDir.spirv_tools}/spirv_tools",

		"./shaderc",
		"./libshaderc_util"
	}

	files {
		"./**.h",
		"./**.cc",
		"./**.hpp",
		"./**.cpp"
	}

 	filter "system:windows"
		disablewarnings { "4996", "4717" }

 	filter "configurations:Debug"
		defines { "MLE_DEBUG_BUILD", "DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines { "MLE_RELEASE_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"

	filter "configurations:Distribution"
		defines {  "MLE_DISTRIBUTION_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"
void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	properties.name("shaderc");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	properties.license("./LICENSE");

	properties.project_includes({
		"glslang",
		"spirv_tools",
		"spirv_headers"
	});

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./libshaderc/include"
	});

	properties.files({
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
	});

	properties.defines({
		"ENABLE_OPT=true",
		"ENABLE_HLSL=true"
	});

	properties.include_directories({
		"./libshaderc/include/",
		"./libshaderc_util/include",
		"./libshaderc/include/shaderc"
	});

	{
		MultiBuild::ScopedFilter _(workspace, "project.compiler:VisualCpp");
		properties.disable_warnings({ "4996", "4717" });
	}
}
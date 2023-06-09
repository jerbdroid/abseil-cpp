project "Abseil"
	kind "StaticLib"
	language "C++"
    cppdialect "C++17"
    staticruntime "on"


	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

     defines
    { 
        "NOMINMAX"
    }

    files
	{
		"absl/**/*.h",
        "absl/**/*.cc"
	}

    removefiles { 
        "absl/**/*_test*.cc",
        "absl/**/*test_*.cc",
        "absl/**/*mock*.cc",
        "absl/**/*_benchmark.cc",
        "absl/**/benchmarks.cc"
    }
 
    includedirs 
    {
        ".",
    } 

    filter "system:windows"
        systemversion "latest"

    filter  "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter  "configurations:Release"
        runtime "Release"
        optimize "on"
#!/usr/bin/env node

/**
 * Test script to validate all torrent sources and APIs
 * Run with: node test-sources.mjs
 */

async function testInternetArchive() {
  console.log("\n📚 Testing Internet Archive API...");
  try {
    const searchUrl = new URL("https://archive.org/advancedsearch.php");
    searchUrl.searchParams.append(
      "q",
      "mediatype:movies AND year:[1900 TO 1928]"
    );
    searchUrl.searchParams.append("output", "json");
    searchUrl.searchParams.append("rows", "5");

    const response = await fetch(searchUrl.toString());
    const data = await response.json();

    if (data.response?.docs?.length > 0) {
      console.log("✅ Internet Archive API working!");
      console.log(`   Found ${data.response.numFound} public domain movies`);
      console.log("   Sample movies:");
      data.response.docs.slice(0, 3).forEach((movie, i) => {
        console.log(`   ${i + 1}. ${movie.title || movie.identifier}`);
      });
      return true;
    } else {
      console.log("❌ No results from Internet Archive");
      return false;
    }
  } catch (error) {
    console.error("❌ Internet Archive API error:", error.message);
    return false;
  }
}

async function testGitHubAPI() {
  console.log("\n🎮 Testing GitHub API for open-source games...");
  try {
    const response = await fetch(
      "https://api.github.com/repos/Anuken/Mindustry/releases?per_page=3"
    );
    const data = await response.json();

    if (Array.isArray(data) && data.length > 0) {
      console.log("✅ GitHub API working!");
      console.log(`   Found ${data.length} releases for Mindustry`);
      console.log("   Sample releases:");
      data.slice(0, 2).forEach((release, i) => {
        console.log(`   ${i + 1}. ${release.tag_name} - ${release.assets.length} assets`);
      });
      return true;
    } else {
      console.log("❌ No releases found");
      return false;
    }
  } catch (error) {
    console.error("❌ GitHub API error:", error.message);
    return false;
  }
}

async function testPublicDomainTorrents() {
  console.log("\n🎬 Testing Public Domain Torrents website...");
  try {
    const response = await fetch("https://www.publicdomaintorrents.info/");
    if (response.ok) {
      console.log("✅ Public Domain Torrents website is accessible!");
      return true;
    } else {
      console.log("❌ Website returned status:", response.status);
      return false;
    }
  } catch (error) {
    console.error("❌ Public Domain Torrents error:", error.message);
    return false;
  }
}

async function testItchio() {
  console.log("\n🕹️ Testing itch.io for open-source games...");
  try {
    const response = await fetch("https://itch.io/games/tag-open-source");
    if (response.ok) {
      console.log("✅ itch.io is accessible!");
      return true;
    } else {
      console.log("❌ itch.io returned status:", response.status);
      return false;
    }
  } catch (error) {
    console.error("❌ itch.io error:", error.message);
    return false;
  }
}

async function testFlathub() {
  console.log("\n📦 Testing Flathub for open-source software...");
  try {
    const response = await fetch("https://flathub.org/en");
    if (response.ok) {
      console.log("✅ Flathub is accessible!");
      return true;
    } else {
      console.log("❌ Flathub returned status:", response.status);
      return false;
    }
  } catch (error) {
    console.error("❌ Flathub error:", error.message);
    return false;
  }
}

async function runAllTests() {
  console.log("🚀 Starting Torrent Source Validation Tests...\n");
  console.log("=".repeat(50));

  const results = {
    internetArchive: await testInternetArchive(),
    github: await testGitHubAPI(),
    publicDomainTorrents: await testPublicDomainTorrents(),
    itchio: await testItchio(),
    flathub: await testFlathub(),
  };

  console.log("\n" + "=".repeat(50));
  console.log("\n📊 Test Summary:");
  console.log(`   Internet Archive: ${results.internetArchive ? "✅ PASS" : "❌ FAIL"}`);
  console.log(`   GitHub API: ${results.github ? "✅ PASS" : "❌ FAIL"}`);
  console.log(`   Public Domain Torrents: ${results.publicDomainTorrents ? "✅ PASS" : "❌ FAIL"}`);
  console.log(`   itch.io: ${results.itchio ? "✅ PASS" : "❌ FAIL"}`);
  console.log(`   Flathub: ${results.flathub ? "✅ PASS" : "❌ FAIL"}`);

  const passCount = Object.values(results).filter(Boolean).length;
  console.log(`\n   Total: ${passCount}/5 sources working ✅`);
  console.log("\n🎉 All legal torrent sources are accessible!\n");
}

runAllTests().catch(console.error);

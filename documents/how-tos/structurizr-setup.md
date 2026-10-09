# Structurizr Setup

[Structurizr](https://github.com/structurizr/structurizr) is a "models as code" tool for the [C4 model](https://c4model.com).
You describe your architecture once in the [Structurizr DSL](https://docs.structurizr.com/dsl) and get several diagrams (System Context, Container, Component, Deployment, …) from that one model.

This guide lists every way to set it up. In this repository we use **option 1: the MCP server** (recommended), so Claude Code can validate, inspect and export DSL for you.

| # | Option | Needs | Good for |
|---|--------|-------|----------|
| 1 | [MCP server](#1-mcp-server-recommended) | Claude Code (or another MCP client) | Writing and checking DSL with an AI assistant |
| 2 | [Playground (online)](#2-playground-online) | A browser | Trying things out, no installation |
| 3 | [Local (Docker)](#3-structurizr-local-docker) | Docker | Viewing and editing diagrams on your own machine |
| 4 | [Local / CLI (Java WAR)](#4-java-war-no-docker) | Java 21+ | Same as 3, without Docker; scripts and CI |
| 5 | [Homebrew](#5-homebrew-macos) | Homebrew | Quick install on macOS |
| 6 | [Self-hosted playground](#6-self-hosted-playground) | Docker | A playground inside your own network |
| 7 | [Server](#7-structurizr-server) | Docker + licence | Shared workspaces for a team |

Current version at the time of writing: **2026.09.19**.

---

## 1. MCP server (recommended)

Structurizr ships an (experimental) [MCP server](https://docs.structurizr.com/ai/mcp). It gives an AI assistant these tools:

| Tool | Flag (self-hosted) | What it does |
|------|--------------------|--------------|
| `validate` | `-dsl` | Checks that DSL parses; returns `OK` or the error |
| `parse` | `-dsl` | Parses DSL and returns the workspace as JSON |
| `inspect` | `-dsl` | Runs the workspace inspections (quality warnings) |
| `export-plantuml` | `-plantuml` | Exports a view as Structurizr PlantUML |
| `export-c4plantuml` | `-plantuml` | Exports a view as C4-PlantUML |
| `export-mermaid` | `-mermaid` | Exports a view as Mermaid |
| `getWorkspaces`, `getWorkspace` | `-server-read` | Reads workspaces from a Structurizr server |
| `createWorkspace` | `-server-create` | Creates a workspace on a server |
| `updateWorkspace` | `-server-update` | Pushes DSL to a server workspace |
| `deleteWorkspace` | `-server-delete` | Deletes a server workspace |

The transport is stateless HTTP at the path `/mcp`.

### 1a. Hosted instance (what this repo uses)

Structurizr runs a public instance at `https://mcp.structurizr.com/mcp` with the DSL, PlantUML and Mermaid tools enabled. Nothing to install.

It is already configured for this repository in [`.mcp.json`](../../.mcp.json):

```json
{
  "mcpServers": {
    "structurizr": {
      "type": "http",
      "url": "https://mcp.structurizr.com/mcp"
    }
  }
}
```

This was created with:

```bash
claude mcp add --transport http --scope project structurizr https://mcp.structurizr.com/mcp
```

**First use:** start `claude` in the repository folder. Claude Code asks you to approve the project MCP server once. Then check it with `/mcp` (or `claude mcp list`): `structurizr` should show as connected.

Want it in every project instead of just this one? Use `--scope user`:

```bash
claude mcp add --transport http --scope user structurizr https://mcp.structurizr.com/mcp
```

> **Privacy note:** the hosted instance receives the DSL you send it. Don't use it for confidential architecture (customer systems, internal hostnames, security details). Use [1b](#1b-self-hosted-with-docker) for those.

### 1b. Self-hosted with Docker

Runs the same server on your machine, so your DSL never leaves it. Needs Docker Desktop to be running.

```bash
docker pull structurizr/mcp
docker run -it --rm -p 3000:3000 -e PORT=3000 structurizr/mcp -dsl -plantuml -mermaid
```

Pick the tool sets you want with the flags from the table above. For example, add `-server-read -server-update` to work with a Structurizr server.

Then point Claude Code at it (remove the hosted entry first if both use the name `structurizr`):

```bash
claude mcp remove structurizr -s project
claude mcp add --transport http --scope project structurizr http://localhost:3000/mcp
```

### 1c. Self-hosted without Docker (Homebrew or from source)

The Homebrew formula (see [option 5](#5-homebrew-macos)) also installs the MCP server as `structurizr-mcp`:

```bash
brew install structurizr
structurizr-mcp -dsl -plantuml -mermaid
```

Or build it from source (needs Java 21+):

```bash
git clone https://github.com/structurizr/structurizr.git
cd structurizr
./mvnw -DskipTests package
./mcp.sh -dsl -plantuml -mermaid      # = java -jar structurizr-mcp/target/structurizr-mcp-1.0.0.war ...
```

It is a Spring Boot app. The port it listens on is printed at startup (usually `8080`). Register `http://localhost:<port>/mcp` as in 1b.

### 1d. Claude Desktop and other stdio-only clients

Claude Desktop does not accept HTTP MCP servers directly. Bridge it with `mcp-remote` in `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "structurizr-mcp": {
      "command": "npx",
      "args": ["mcp-remote", "https://mcp.structurizr.com/mcp"]
    }
  }
}
```

Replace the URL with `http://localhost:3000/mcp` for a self-hosted server.

### Using it

Ask Claude things like:

- "Validate `docs/architecture/workspace.dsl` with the Structurizr MCP."
- "Run `inspect` on this DSL and fix the warnings."
- "Export the `SystemContext` view as Mermaid and put it in the README."

Quick test without Claude (should print `"text":"OK"`):

```bash
curl -s -X POST https://mcp.structurizr.com/mcp \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/call","params":{"name":"validate","arguments":{"dsl":"workspace {\n model {\n u = person \"User\"\n s = softwareSystem \"Shop\"\n u -> s \"Uses\"\n }\n views {\n systemContext s {\n include *\n autolayout lr\n }\n }\n}"}}}'
```

The MCP server validates and exports text. It does **not** render pictures. To see the diagrams, use the playground (2) or Structurizr local (3).

---

## 2. Playground (online)

Open [playground.structurizr.com](https://playground.structurizr.com), paste or upload DSL, and the diagrams render in the browser. You can save DSL to browser local storage and browse themes.

No installation. Same privacy note as the hosted MCP: the DSL goes to a public service.

---

## 3. Structurizr local (Docker)

The usual way to work on diagrams on your own machine. It watches a folder with a `workspace.dsl` and serves the diagrams on `http://localhost:8080`.

```bash
docker pull structurizr/structurizr
docker run -it --rm -p 8080:8080 \
  -v "$PWD/architecture":/usr/local/structurizr \
  structurizr/structurizr local
```

- Put your `workspace.dsl` in the mounted folder (here `./architecture`).
- Open <http://localhost:8080>, edit the DSL in your IDE, and refresh the browser.
- Diagram layout changes you make in the browser are saved to `workspace.json` in the same folder. Commit it together with the DSL.

Docs: [local quickstart](https://docs.structurizr.com/local/quickstart).

> Structurizr local replaces the older **Structurizr Lite** (`structurizr/lite`), which is end-of-life.

---

## 4. Java WAR (no Docker)

One WAR file contains all commands. Needs **Java 21** or newer.

```bash
curl -LO https://download.structurizr.com/structurizr.war   # latest
java -jar structurizr.war <command> [parameters]
```

There is also a `structurizr-<version>-playwright.war` variant, which bundles Playwright (a headless browser). It is meant for the browser-based exports like PNG/SVG.

Useful commands:

```bash
# Same as option 3, without Docker
java -jar structurizr.war local

# Check DSL (good for CI)
java -jar structurizr.war validate -workspace workspace.dsl
java -jar structurizr.war inspect  -workspace workspace.dsl

# Export diagrams
java -jar structurizr.war export -workspace workspace.dsl -format mermaid -output diagrams
java -jar structurizr.war export -workspace workspace.dsl -format plantuml/c4plantuml -output diagrams
java -jar structurizr.war export -workspace workspace.dsl -format static -output site
```

Export formats: `plantuml`, `plantuml/c4plantuml`, `mermaid`, `websequencediagrams`, `static` (HTML site), `png`, `svg`, `json`, `theme`.

The same commands work in Docker: `docker run --rm -v "$PWD":/usr/local/structurizr structurizr/structurizr <command> ...`.

Docs: [binaries](https://docs.structurizr.com/binaries), [export](https://docs.structurizr.com/export), [commands](https://docs.structurizr.com/commands).

---

## 5. Homebrew (macOS)

A community-maintained formula (not maintained by Structurizr) builds the WARs from source and installs two commands: `structurizr` (all commands from option 4) and `structurizr-mcp` (the MCP server, see 1c).

```bash
brew install structurizr
structurizr local
structurizr validate -workspace workspace.dsl
```

---

## 6. Self-hosted playground

Runs the playground from option 2 inside your network:

```bash
docker run -it --rm -p 8080:8080 structurizr/structurizr playground

# other port, with themes
docker run -it --rm -p 9090:9090 -e PORT=9090 \
  -e STRUCTURIZR_THEMES=/usr/local/structurizr-themes \
  structurizr/structurizr playground
```

---

## 7. Structurizr server

A web server with multiple workspaces for a team, with an API that the CLI (`push`, `pull`, `lock`, …) and the MCP `server-*` tools can use. **Needs a licence.**

```bash
docker run -it --rm -p 8080:8080 \
  -v "$HOME/structurizr":/usr/local/structurizr \
  structurizr/structurizr server
```

Authentication is off by default. Docs: [server quickstart](https://docs.structurizr.com/server/quickstart).

---

## Minimal `workspace.dsl`

Works with every option above:

```
workspace {
    model {
        user = person "User"
        shop = softwareSystem "Shop" {
            web = container "Web App" "" "Java / Quarkus"
            db  = container "Database" "" "PostgreSQL" "Database"
        }
        user -> web "Uses"
        web  -> db  "Reads and writes"
    }
    views {
        systemContext shop {
            include *
            autolayout lr
        }
        container shop {
            include *
            autolayout lr
        }
        styles {
            element "Database" {
                shape cylinder
            }
        }
    }
}
```

`validate` returns `OK` for this example.

> **No `theme default`:** the Structurizr cloud service reached its end of life on 30 September 2026. `theme default` loads `https://static.structurizr.com/themes/default/theme.json`, which is no longer available, so the CLI's `validate` fails with `could not be loaded` (the hosted MCP may still report `OK`). Leave the line out, or use a theme file stored locally. `inspect` lists findings such as a missing workspace scope, missing descriptions, and relationships without a technology. That makes it a good first exercise for improving a model.

## Links

- Repository: <https://github.com/structurizr/structurizr>
- Documentation: <https://docs.structurizr.com>
- DSL tutorial: <https://docs.structurizr.com/dsl/tutorial>
- MCP server: <https://docs.structurizr.com/ai/mcp>

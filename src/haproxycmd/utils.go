package haproxycmd

import (
	"bufio"
	"os"
	"regexp"
)

const (
	HaproxyCfg = "/etc/haproxy/haproxy.cfg"
)

func findSocketPathFromConfig(cfg *os.File) string {
	scanner := bufio.NewScanner(cfg)
	re := regexp.MustCompile(`\bstats\s+socket\s+(\S+)`)

	for scanner.Scan() {
		line := scanner.Text()
		m := re.FindStringSubmatch(line)

		if len(m) < 2 {
			continue
		}

		return m[1]
	}

	if err := scanner.Err(); err != nil {
		panic(err)
	}

	return ""
}

func FindHaproxySocket() string {
	cfg, err := os.Open(HaproxyCfg)

	if err != nil {
		panic(err)
	}

	defer cfg.Close()

	sock := findSocketPathFromConfig(cfg)

	return sock
}

import os
import re
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse

OUT_DIR = "exercises"
os.makedirs(OUT_DIR, exist_ok=True)

# all your muscle group pages
MUSCLE_URLS = [
    "https://training.fit/abs-workout/",
    "https://training.fit/biceps-training/",
    "https://training.fit/chest-training/",
    "https://training.fit/neck-training/",
    "https://training.fit/thigh-training/",
    "https://training.fit/butt-training/",
    "https://training.fit/back-training/",
    "https://training.fit/shoulder-training/",
    "https://training.fit/triceps-training/",
    "https://training.fit/forearm-training/",
    "https://training.fit/calves-training/",
]


def slugify(name: str) -> str:
    """Turn 'Push-Ups with Exercise Ball' → 'push-ups-with-exercise-ball'."""
    name = name.strip().lower()
    name = re.sub(r"[^a-z0-9]+", "-", name)
    name = re.sub(r"-+", "-", name).strip("-")
    return name or "exercise"


def get_ext(url: str) -> str:
    path = urlparse(url).path
    ext = os.path.splitext(path)[1]
    return ext or ".png"


def scrape_listing(url: str):
    print(f"\n=== Scraping {url} ===")
    resp = requests.get(url)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")

    # all exercise articles
    for article in soup.find_all("article", class_="uebung"):
        # name
        h2 = article.find("h2")
        if not h2:
            continue
        name = h2.get_text(strip=True)
        slug = slugify(name)

        # image (prefer data-src, fallback src)
        img = article.find("img")
        if not img:
            continue
        img_url = img.get("data-src") or img.get("src")
        if not img_url:
            continue

        img_url = urljoin(url, img_url)
        ext = get_ext(img_url)
        filename = f"{slug}{ext}"
        filepath = os.path.join(OUT_DIR, filename)

        if os.path.exists(filepath):
            print(f"Skipping existing: {filename}")
            continue

        print(f"Downloading: {name} -> {filename}")
        r = requests.get(img_url)
        if not r.ok:
            print("  failed:", r.status_code)
            continue

        with open(filepath, "wb") as f:
            f.write(r.content)


for url in MUSCLE_URLS:
    scrape_listing(url)

print("\nDone.")

//Equal as https://www.youtube.com/watch?v=ERaGORGfLF4 5:30
import { promises as fs } from "fs";
(async () => {
  try {
    const data = await fs.readFile("./input.txt", "utf8");
    const lines = data.split("\n");
    lines.forEach((element) => {
      console.log(element.trim());
    });
  } catch (err) {
    console.error(err);
  }
})();

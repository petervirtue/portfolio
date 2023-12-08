import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faGithub, faLinkedin } from "@fortawesome/free-brands-svg-icons";
import Link from "next/link";

export const Socials = () => {
  const links = [
    {
      name: "github",
      href: "https://github.com/petervirtue",
      icon: faGithub,
    },
    {
      name: "linkedin",
      href: "https://www.linkedin.com/in/petervirtue/",
      icon: faLinkedin,
    },
  ];

  return (
    <nav className="my-5">
      <ul className="flex items-start justify-start gap-4">
        {links.map((item) => (
          <Link
            key={item.href}
            href={item.href}
            target="_blank"
            className="flex items-center jusfity-center text-md duration-200 text-slate-400 hover:text-slate-50"
          >
            <FontAwesomeIcon className="mr-2" icon={item.icon} />
            {item.name}
          </Link>
        ))}
      </ul>
    </nav>
  );
};

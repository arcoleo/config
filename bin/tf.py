#!/usr/bin/env python3

import argparse
import subprocess


def parse_args():
    parser = argparse.ArgumentParser(description='Execute Terraform')
    parser.add_argument('-d', '--dry-run', action='store_true')

    parser.add_argument('--destroy', action='store_true')
    parser.add_argument('--plan', action='store_true', default=True, help='Create a plan')
    parser.add_argument('--plan-file', default='terraform.tfplan')
    parser.add_argument('--apply', action='store_true')

    parser.add_argument('--target', choices=['master', 'minion', 'wiki'])

    parser.add_argument('--reset', action='store_true', help='reset and recreate everything')

    args = parser.parse_args()

    if args.reset:
        args.destroy = True
        args.plan = True
        args.apply = True

    return args

def terraform(args):
    commands = []
    target_str = None

    if args.target == 'master':
        target_str = '-target=digitalocean_droplet.master'
    elif args.target == 'minion':
        target_str = '-target=digitalocean_droplet.minion'
    elif args.target == 'wiki':
        target_str = '-target=digitalocean_droplet.wiki'

    if not (args.destroy or args.plan or args.apply):
        print('Nothing to do')
        return()

    if args.destroy:    
        command = ['terraform', 'plan', '-destroy', '-out=delete.tfplan']
        if target_str:
            command.append(target_str)
        commands.append(command)
        commands.append(['terraform', 'apply', 'delete.tfplan'])
    
    if args.plan:
        command = ['terraform', 'plan', '-out=%s' % args.plan_file]
        if target_str:
            command.append(target_str)
        commands.append(command)

    if args.apply:
        commands.append(['terraform', 'apply', args.plan_file])

    print('Executing')
    for command in commands:
        print(command)
        if args.dry_run is False:
            p = subprocess.run(command)


if __name__ == '__main__':
    args = parse_args()
    terraform(args)
